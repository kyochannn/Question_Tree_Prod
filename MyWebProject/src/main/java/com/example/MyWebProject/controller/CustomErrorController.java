package com.example.MyWebProject.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

    @GetMapping("/error")
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());

            // 404 Not Found
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return "error/404"; // /WEB-INF/views/error/404.jsp
            }
            // 403 Forbidden
            else if (statusCode == HttpStatus.FORBIDDEN.value()) {
                return "error/403"; // /WEB-INF/views/error/403.jsp
            }
            // 500 Internal Server Error
            else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return "error/500"; // /WEB-INF/views/error/500.jsp
            }
        }

        // 그 외 모든 에러는 기본 에러 페이지로
        return "error/default"; // /WEB-INF/views/error/default.jsp
    }
}