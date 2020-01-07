
package com.mycompany.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


//@Configuration
@EnableWebSecurity
public class MyWebSecurityConfigurer extends WebSecurityConfigurerAdapter {
    

    @Autowired
    UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.authenticationProvider(authenticationProvider());

                
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()//Restrivt access based on HttpServletRequest
                .antMatchers("/").hasAnyRole("USER","ADMIN")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/*/create/**","/*/update/**","/*/delete/**").hasRole("ADMIN")
                .and()
                .formLogin() // we are customizing the form login process
                .loginPage("/") //show my form at the request mapping
                .loginProcessingUrl("/authenticate") //Login form will Post data to this Url for processing user 
                .permitAll()//allow everyone to see Login page.Dont have to be logged in
                .and().logout().permitAll()
                .and().exceptionHandling().accessDeniedPage("/access-denied");
                
    }
     @Bean
    public DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider auth=new DaoAuthenticationProvider();
        auth.setUserDetailsService(userDetailsService);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }
    
    @Bean
    public BCryptPasswordEncoder  passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    
    
}
