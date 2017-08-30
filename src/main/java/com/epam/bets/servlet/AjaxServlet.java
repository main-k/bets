package com.epam.bets.servlet;

import com.epam.bets.command.AjaxCommand;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.epam.bets.exception.CommandException;
import com.epam.bets.factory.AjaxCommandFactory;
import com.epam.bets.request.RequestContent;
import com.google.gson.Gson;

import static com.epam.bets.constant.PageConstant.SERVER_ERROR_PAGE;

@WebServlet(name = "AjaxServlet", urlPatterns = {"/ajax"})
public class AjaxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String commandName = request.getParameter("command");
        AjaxCommand command = new AjaxCommandFactory().initCommand(commandName);
        RequestContent content = new RequestContent();
        content.extractValues(request);
        response.setContentType("application/json");
        try {
            response.getWriter().write(new Gson().toJson(command.execute(content)));
            content.insertValues(request);
        } catch (CommandException e) {
            response.sendRedirect(SERVER_ERROR_PAGE);
        }
    }
}
