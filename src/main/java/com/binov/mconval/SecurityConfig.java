package com.binov.mconval;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Value("${spring.queries.users-query}")
	private String usersQuery;
	
	@Value("${spring.queries.roles-query}")
	private String rolesQuery;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth)
			throws Exception {
		auth.
			jdbcAuthentication()
				.usersByUsernameQuery(usersQuery)
				.authoritiesByUsernameQuery(rolesQuery)
				.dataSource(dataSource)
				.passwordEncoder(bCryptPasswordEncoder)
				;
	}
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.
		authorizeRequests()
			.antMatchers("/ho/..").hasRole("ho")
			.antMatchers("/mc/..").hasRole("mc")
			//.antMatchers("/ho/**").hasRole("ho")
			//.antMatchers("/mc/**").hasRole("mc")
			.and().csrf().disable().formLogin().loginProcessingUrl("/j_spring_security_check")
			.loginPage("/login").failureUrl("/login?error=true").successHandler(customAuthenticationSuccessHandler)
			.usernameParameter("j_username")
			.passwordParameter("j_password")
			.and().logout().logoutUrl("/logout").logoutSuccessUrl("/login");
    }

   //Permission pour les ressources Web
    @Override
	public void configure(WebSecurity web) throws Exception {
	    web.ignoring().antMatchers("/resources/**","/login","/logout","/","/creer_compte");
	}

   /* @Bean
    @Override
    public UserDetailsService userDetailsService() {
        UserDetails user =
             User.withDefaultPasswordEncoder()
                .username("email")
                .password("password")
                .roles("USER")
                .build();

        return new InMemoryUserDetailsManager(user);
    }*/
}