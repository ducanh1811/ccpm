package vn.iotstar.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		super.applyCustomConfiguration(builder);
		builder.addDecoratorPath("/", "/decorators/homepage.jsp")
		.addDecoratorPath("/history", "/decorators/callhistory.jsp")
		.addDecoratorPath("/history/*", "/decorators/callhistory.jsp")
		.addDecoratorPath("/report/live", "/decorators/live.jsp")
		.addDecoratorPath("/report/inbound", "/decorators/inbound.jsp")
		.addDecoratorPath("/contact", "/decorators/contact.jsp")
		.addDecoratorPath("/report", "/decorators/live.jsp")
		.addDecoratorPath("/home", "/decorators/homepage.jsp")
		.addDecoratorPath("/login", "/decorators/login.jsp")
		.addDecoratorPath("/signup", "/decorators/signup.jsp")
		.addDecoratorPath("/report/servicelevel", "/decorators/servicelevel.jsp")
		.addDecoratorPath("/report/dashboard", "/decorators/dashboard.jsp")
		.addDecoratorPath("/report/outbound", "/decorators/outbound.jsp")
		.addDecoratorPath("/report/agent", "/decorators/agent.jsp")
		.addDecoratorPath("/report/call", "/decorators/call.jsp")
		.addDecoratorPath("/admin/*", "/decorators/admin/home.jsp")
		.addDecoratorPath("/profile/*", "/decorators/profile.jsp")
		
		;
	}
	
}
