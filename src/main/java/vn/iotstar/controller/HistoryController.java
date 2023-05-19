package vn.iotstar.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iotstar.entity.Agent;
import vn.iotstar.entity.Call;
import vn.iotstar.entity.CallDetail;
import vn.iotstar.entity.Customer;
import vn.iotstar.repository.CallDetailRepository;
import vn.iotstar.repository.CallRepository;
import vn.iotstar.repository.CustomerRepository;

@Controller
@RequestMapping("")
public class HistoryController {
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private CallRepository callRepository;
	
	@Autowired
	private CallDetailRepository callDetailRepository;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/badRequest")
	public String badRequest() {
		return "badRequest";
	}
	
	@GetMapping("/history")
	public String showHomePage(ModelMap model) {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		List<Call> callList = callRepository.findAll();
		model.addAttribute("callList", callList);
		return "callhistory";
	}
	@GetMapping("/history/{id}")
	public String showCallhistoryDetail(ModelMap model, @PathVariable("id") Integer id) {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		Optional<CallDetail> optCallDetail = callDetailRepository.findByCallId(id);
		model.addAttribute("callDetail", optCallDetail.get());
		return "callhistorydetail";
	}
	@GetMapping("/report/live")
	public String showLive(ModelMap model) {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		List<CallDetail> callDetailList = callDetailRepository.findAll();
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

		Long avgAbandonTime = 0L;
		Long avgTimeOneQueue = 0L;
		Long avgWaitTime = 0L;
		Long longestWaitTime = callDetailList.get(0).getWaitTime().getTime();
		double avgServiceLevel = 0;
		DecimalFormat df = new DecimalFormat("#.##");
		
		for (CallDetail callDetail : callDetailList) {
			avgAbandonTime += callDetail.getTimeAbandoned().getTime();
			avgWaitTime += callDetail.getWaitTime().getTime();
			avgTimeOneQueue += callDetail.getTimeOnQueue().getTime();
			if (longestWaitTime < callDetail.getWaitTime().getTime()) {
				longestWaitTime = callDetail.getWaitTime().getTime();
			}
			avgServiceLevel += callDetail.getServiceLevel();
		}
		model.addAttribute("serviceLevel", df.format(avgServiceLevel * 100 / callDetailList.size()));
		model.addAttribute("avgAbandonTime", dateFormat.format(new Date(avgAbandonTime/callDetailList.size())));
		model.addAttribute("longestWaitTime", dateFormat.format(new Date(longestWaitTime)));
		model.addAttribute("avgWaitTime", dateFormat.format(new Date(avgWaitTime/callDetailList.size())));
		return "live";
	}

	@GetMapping("/contact")
	public String showContact(ModelMap model) {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		List<Customer> customerList = customerRepository.findAll();
		model.addAttribute("customerList", customerList);
		return "contact";
	}

	@GetMapping("/contact/{id}")
	public String showContactDetail(ModelMap model) {
		return "contactDetail";
	}

	@GetMapping("/contact/1/update")
	public String showContactDetailUpdate() {
		return "contactDetailUpdate";
	}

	@GetMapping("/report")
	public String showReport() {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		return "redirect:/report/dashboard";
	}

	@GetMapping("/report/inbound")
	public String showRPInbound(ModelMap model) {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		int maxMonth = 1;
		int totalCall = 0;
		int answeredCall = 0;
		int missedCall = 0;
		int abandonedCall = 0;
		int shortAbandonedCall = 0;
		
		List<Call> callList = callRepository.findAll();
		for (Call call : callList) {
			if (call.getCreateAt().getMonth() > maxMonth) {
				maxMonth = call.getCreateAt().getMonth();
			}
			if (call.getCallResponse() == true) {
				answeredCall += 1;
			} else {
				missedCall += 1;
			}
			if (call.getCallDetail().getTimeAbandoned() != null) {
				if (call.getCallDetail().getTimeAbandoned().getHours() == 0 
						&& call.getCallDetail().getTimeAbandoned().getMinutes() < 1) {
					shortAbandonedCall += 1;
				}
				else {
					abandonedCall += 1;
				}
			}
		}
		totalCall = callList.size();
		
		List<String> monthList = new ArrayList<>();
		for (int i = 0; i < maxMonth; i++) {
			monthList.add("Tháng " + String.valueOf(i + 1));
		}
		
		List<Integer> values = new ArrayList<>();
		int startMonth = 1;
		for (String month : monthList) {
			values.add(callCount(startMonth, callList));
			startMonth++;
		}
		Gson gSon = new Gson();
		
		String labelsJson = gSon.toJson(monthList);
		model.addAttribute("labelsJson", labelsJson);
		
		//model.addAttribute("labels", monthList);
		model.addAttribute("values", values);
		model.addAttribute("totalCall", totalCall);
		model.addAttribute("answeredCall", answeredCall);
		model.addAttribute("missedCall", missedCall);
		model.addAttribute("abandonedCall", abandonedCall);
		model.addAttribute("shortAbandonedCall", shortAbandonedCall);
		
		return "inbound";
	}
	private Integer callCount(int i, List<Call> callList) {
		
		int count = 0;
		for (Call call : callList) {
			if (call.getCreateAt().getMonth() == i) {
				count += 1;
			}
		}
		
		return count;
	}
	
	private Double avgServiceLevel(int i, List<Call> callList) {
		Double avgSL = 0.0;
		Integer count = 0;
		for (Call call : callList) {
			if (call.getCreateAt().getMonth() == i) {
				avgSL += call.getCallDetail().getServiceLevel();
				count ++;
			}
		}
		return (Double) avgSL/count;
	}

	@GetMapping("/")
	public String showHome() {
		
		return "home";
	}
	@GetMapping("/report/servicelevel")
	public String showServicelevel(ModelMap model) {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		DecimalFormat df = new DecimalFormat("#.##");
		
		List<Call> callList = callRepository.findAll();
		
		Double serviceLevel = 0.0;
		Long abandonTime = 0L;
		Long longestAbandonTime = callList.get(0).getCallDetail().getTimeAbandoned().getTime();
		Long waitTime = 0L;
		Long longestWaitTime = callList.get(0).getCallDetail().getWaitTime().getTime();
		Long totalDuration = 0L;
		Long longestDuration = callList.get(0).getCallDetail().getTimeOnQueue().getTime();

		int maxMonth = 1;
		
		for (Call call : callList) {
			if (call.getCreateAt().getMonth() > maxMonth) {
				maxMonth = call.getCreateAt().getMonth();
			}
			//tinh tong service level
			serviceLevel += call.getCallDetail().getServiceLevel();
			//tim logestabandontime
			if (call.getCallDetail().getTimeAbandoned().getTime() > longestAbandonTime) {
				longestAbandonTime = call.getCallDetail().getTimeAbandoned().getTime();
			}
			//tinh sum abandontime
			abandonTime += call.getCallDetail().getTimeAbandoned().getTime();
			
			//tinh longestwaittime
			if (call.getCallDetail().getWaitTime().getTime() > longestWaitTime) {
				longestWaitTime = call.getCallDetail().getWaitTime().getTime();
			}
			//tinh sum waittime
			waitTime += call.getCallDetail().getWaitTime().getTime();
			//tinh total duration
			totalDuration = call.getCallDetail().getTimeOnQueue().getTime();
			if (call.getCallDetail().getTimeOnQueue().getTime() > longestDuration) {
				longestDuration = call.getCallDetail().getTimeOnQueue().getTime();
			}
		}
		
		List<String> monthList = new ArrayList<>();
		for (int i = 0; i < maxMonth; i++) {
			monthList.add("Tháng " + String.valueOf(i + 1));
		}
		
		List<Double> values = new ArrayList<>();
		int startMonth = 1;
		for (String month : monthList) {
			values.add(avgServiceLevel(startMonth, callList));
			startMonth++;
		}
		Gson gSon = new Gson();
		
		String labelsJson = gSon.toJson(monthList);
		
		model.addAttribute("values", values);
		model.addAttribute("labels", labelsJson);
		model.addAttribute("serviceLevel", df.format(serviceLevel * 100 / callList.size()));
		model.addAttribute("avgAbandonTime", dateFormat.format(new Date(abandonTime/callList.size())));
		model.addAttribute("longestAbandonTime", dateFormat.format(new Date(longestAbandonTime)));
		model.addAttribute("avgWaitTime", dateFormat.format(new Date(waitTime/callList.size())));
		model.addAttribute("longestWaitTime", dateFormat.format(new Date(longestWaitTime)));
		model.addAttribute("totalDuration", dateFormat.format(new Date(totalDuration)));
		model.addAttribute("avgDuration", dateFormat.format(new Date(totalDuration/callList.size())));
		model.addAttribute("longestDuration", dateFormat.format(new Date(longestDuration)));
		
		return "servicelevel";
	}
	@GetMapping("/report/dashboard")
	public String showRPDashboard(ModelMap model) {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

		List<Call> callList = callRepository.findAll();
		List<Call> nowCallList = new ArrayList<>();
		Long avgWaitTime = 0L;
		double serviceLevel = 0;
		Integer callResponseCount = 0;
		Integer callAbandondCount = 0;
		DecimalFormat df = new DecimalFormat("#.##");
		Date now = new Date(System.currentTimeMillis());
		
		for (Call call: callList) {
			if (call.getCreateAt().getHours() == now.getHours()) {
				nowCallList.add(call);
			}
			
			avgWaitTime += call.getCallDetail().getWaitTime().getTime();
		}
		for (Call c : nowCallList) {
			serviceLevel += c.getCallDetail().getServiceLevel();
			if (c.getCallResponse() == true) {
				callResponseCount++;
			} else {
				callAbandondCount++;
			}
		}
		model.addAttribute("serviceLevel", df.format(serviceLevel * 100 / callList.size()));
		model.addAttribute("nowCallList", nowCallList);
		model.addAttribute("abandonRate", callResponseCount/callList.size());
		model.addAttribute("avgHandleTime", dateFormat.format(new Date(avgWaitTime/callList.size())));
		model.addAttribute("callResponse", callResponseCount);
		model.addAttribute("callAbandon", callAbandondCount);
		
		return "dashboard";
	}
	@GetMapping("/report/outbound")
	public String showRPOutbound() {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		return "outbound";
	}
	@GetMapping("/report/agent")
	public String showRPAgent() {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		return "agent";
	}
	@GetMapping("/report/call")

	public String showRPCalls() {
		Agent user = (Agent) session.getAttribute("user");
		if (user == null) {
			return "redirect:/badRequest";
		}
		return "call";
	}
}
