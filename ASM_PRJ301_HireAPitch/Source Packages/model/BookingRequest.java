/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class BookingRequest {
    private int userId;
    private int pitchId;
    private String selectedTimeSlot;

    public BookingRequest(int userId, int pitchId, String selectedTimeSlot) {
        this.userId = userId;
        this.pitchId = pitchId;
        this.selectedTimeSlot = selectedTimeSlot;
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

    public String getSelectedTimeSlot() {
        return selectedTimeSlot;
    }

    public void setSelectedTimeSlot(String selectedTimeSlot) {
        this.selectedTimeSlot = selectedTimeSlot;
    }
}
