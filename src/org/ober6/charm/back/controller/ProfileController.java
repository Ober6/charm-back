package org.ober6.charm.back.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.ober6.charm.back.model.Profile;
import org.ober6.charm.back.service.ProfileService;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    private final ProfileService service = ProfileService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        String forwardUri = "/notFound";

        if (id != null) {
            Optional<Profile> optional = service.findById(Long.parseLong(id));
            if(optional.isPresent()){
                req.setAttribute("profile", optional.get());
                forwardUri = "WEB-INF/jsp/profile.jsp";
            }
        }
        req.getRequestDispatcher(forwardUri).forward(req, resp);
    }
}