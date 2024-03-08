package org.taashee.managementwebapp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.stereotype.Component;

@Component
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class ApplicationSecurityConfig extends WebSecurityConfigurerAdapter {

	private final PasswordEncoder passwordEncoder;
	private final DaoUserDetailsService daoUserDetailsService;
	private final CustomSuccessHandler customSuccessHandler;

	@Autowired
	public ApplicationSecurityConfig(PasswordEncoder passwordEncoder, DaoUserDetailsService daoUserDetailsService,
			CustomSuccessHandler customSuccessHandler) {
		super();
		this.passwordEncoder = passwordEncoder;
		this.daoUserDetailsService = daoUserDetailsService;
		this.customSuccessHandler = customSuccessHandler;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
				.antMatchers("/admin/**").hasRole("ADMIN")
				.antMatchers("/instructor/**").hasRole("INSTRUCTOR")
				.antMatchers("/student/**").hasRole("STUDENT")
				.anyRequest().authenticated()
				.and().formLogin()
				.successHandler(customSuccessHandler).and().httpBasic();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(daoAuthenticationProvider());
	}

	public DaoAuthenticationProvider daoAuthenticationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setPasswordEncoder(passwordEncoder);
		provider.setUserDetailsService(daoUserDetailsService);
		return provider;
	}

	

}
