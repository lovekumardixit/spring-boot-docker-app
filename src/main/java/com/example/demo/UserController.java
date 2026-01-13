package com.example.demo;
import org.springframework.web.bind.annotation.*;
import java.util.List;

//Hello
// I added this comment to see changes in my another branch Kindly ignore this command....Thankyou!!
@RestController
@RequestMapping("/api")
public class UserController {

    private final UserRepo repo;

    public UserController(UserRepo repo) {
        this.repo = repo;
        if(repo.count()==0){
            User u1 = new User();
            u1.setName("Love Dixit");
            u1.setEmail("love@local.api");

            User u2 = new User();
            u2.setName("Aryan Upadhyay");
            u2.setEmail("aryan@local.api");

            repo.saveAll(List.of(u1,u2));
        }
    }

    @GetMapping("/users")
    public List<User> getUsers(){
        return repo.findAll();
    }

    @PostMapping("/users")
    public User addUser(@RequestBody User u){
        return repo.save(u);
    }
}
