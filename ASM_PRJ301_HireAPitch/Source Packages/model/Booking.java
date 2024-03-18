/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.UserDAO;
import dal.pitchDAO;

/**
 *
 * @author Admin
 */
public class Booking {
    private int bookingId;
    private String bookDay;
    private String timeStart;
    private String timeEnd;
    private int userId;
    private int pitchId;

    public Booking() {
    }

    public Booking(int bookingId, String bookDay, String timeStart, String timeEnd, int userId, int pitchId) {
        this.bookingId = bookingId;
        this.bookDay = bookDay;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.userId = userId;
        this.pitchId = pitchId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getBookDay() {
        return bookDay;
    }

    public void setBookDay(String bookDay) {
        this.bookDay = bookDay;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPitchId() {
        return pitchId;
    }

    public void setPitchId(int pitchId) {
        this.pitchId = pitchId;
    }
    
    public User getCustomer() {
        UserDAO uDao = new UserDAO();
        return uDao.getUserById(this.userId);
    }
    
    public Pitch getPitch() {
        pitchDAO pDao = new pitchDAO();
        return pDao.getPitchById(this.pitchId);
    }
}
