package com.example.computersell.controllers;

import com.example.computersell.models.User;
import com.example.computersell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
//@PreAuthorize("hasAuthority('ROLE_SELLER')")
public class SellerController {
    private final UserService userService;

    @GetMapping("/seller")
    public String seller(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("products", user.getProducts());
        return "seller";
    }
}
