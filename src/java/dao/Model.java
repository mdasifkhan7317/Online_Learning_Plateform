/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;
import jakarta.servlet.http.*;
/**
 *
 * @author husain
 */
public interface Model {
    public void requestProcessor(HttpServletRequest request,HttpServletResponse response);
}
