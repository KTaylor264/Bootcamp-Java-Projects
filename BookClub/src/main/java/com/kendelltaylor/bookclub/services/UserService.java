package com.kendelltaylor.bookclub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.kendelltaylor.bookclub.models.LoginUser;
import com.kendelltaylor.bookclub.models.User;
import com.kendelltaylor.bookclub.repositories.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepo;
	
	public UserService (UserRepository userRepository)
	{
		this.userRepo = userRepository;
	}
	
	public User findById(Long id)
	{
		Optional<User> optionalUser = userRepo.findById(id);
		
		if (optionalUser.isPresent())
		{
			return optionalUser.get();
		}
		else
		{
			return null;
		}
	}
	
	public User findByEmail(String email)
	{
		Optional<User> optionalUser = userRepo.findByEmail(email);
		
		if (optionalUser.isPresent())
		{
			return optionalUser.get();
		}
		else
		{
			return null;
		}
	}
	
	public User register(User newUser, BindingResult result)
	{
		Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
		
		// Reject if the user email is already taken
		if (optionalUser.isPresent())
		{
			result.rejectValue("email", "Exists", "User/Email already exists!");
			return null;
		}
		
		// Reject if the user password is not matching with confirmation password
		if (!newUser.getPassword().equals(newUser.getConfirm()))
		{
			result.rejectValue("confirm", "Matches", "Password and Confirm Password not matching!");
			return null;
		}
		
		// return null if result has errors
		if (result.hasErrors())
		{
			return null;
		}
		else
		{
			// Hash and set password, save user to database if no errors
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			
			return userRepo.save(newUser);
		}
	}
	
	public User login(LoginUser newLoginObject, BindingResult result)
	{	
		Optional<User> optionalUser = userRepo.findByEmail(newLoginObject.getLoginEmail());
		
		// If user with that email does not exist in the database, reject if the user is not present
		if (!optionalUser.isPresent())
		{			
			result.rejectValue("loginEmail", "NotExists", "User does not exist!");
			return null;
		}
		
		User thisUser = optionalUser.get();

		// if the password doesn't match, reject
		if (!BCrypt.checkpw(newLoginObject.getLoginPassword(), thisUser.getPassword()))
		{
			result.rejectValue("loginPassword", "ValidPassword", "Invalid Password!");
			return null;
		}
		
		// return null if result has errors
		if (result.hasErrors())
		{
			return null;
		}
		else
		{
			// else return the user object
			return thisUser;
		}
	}
}
