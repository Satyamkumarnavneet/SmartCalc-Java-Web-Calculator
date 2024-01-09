package org.example.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.servlets.CalculatorService;

import java.io.IOException;

@WebServlet(urlPatterns = "/Calculate")
public class Add extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String param1 = request.getParameter("num1");
        String param2 = request.getParameter("num2");
        String operation = request.getParameter("operation");

        if (param1 != null && param2 != null && operation != null) {
            try {
                int num1 = Integer.parseInt(param1);
                int num2 = Integer.parseInt(param2);
                int result = 0;

                switch (operation) {
                    case "add":
                        result = CalculatorService.add(num1, num2);
                        break;
                    case "subtract":
                        result = CalculatorService.subtract(num1, num2);
                        break;
                    case "multiply":
                        result = CalculatorService.multiply(num1, num2);
                        break;
                    case "divide":
                        double divisionResult = CalculatorService.divide(num1, num2);
                        // Set the result as a request attribute (formatted as a string)
                        request.setAttribute("result", String.format("%.2f", divisionResult));
                        break;
                    default:
                        throw new IllegalArgumentException("Invalid operation");
                }

                if (!operation.equals("divide")) {
                    // Set result as a request attribute
                    request.setAttribute("result", result);
                }

                // Forward the request to the JSP page
                RequestDispatcher dispatcher = request.getRequestDispatcher("/calculator.jsp");
                dispatcher.forward(request, response);
            } catch (NumberFormatException e) {
                // Handle invalid number format
                response.getWriter().println("Invalid number format");
            } catch (ArithmeticException e) {
                // Handle division by zero
                response.getWriter().println(e.getMessage());
            } catch (IllegalArgumentException e) {
                // Handle invalid operation
                response.getWriter().println(e.getMessage());
            }
        } else {
            // Handle null parameters
            response.getWriter().println("Invalid parameters");
        }
    }
}
