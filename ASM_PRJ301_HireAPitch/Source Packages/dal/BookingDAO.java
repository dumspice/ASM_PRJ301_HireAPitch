/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Booking;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Admin
 */
public class BookingDAO extends DBContext{
    public void insert(Booking b) {
        try {
            
            String sql = "INSERT INTO Booking (Book_day, Time_start, Time_end, [User_id], [Pitch_id]) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBookDay());
            st.setString(2, b.getTimeStart());
            st.setString(3, b.getTimeEnd());
            st.setInt(4, b.getUserId());
            st.setInt(5, b.getPitchId());
            
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            // Handle database error
            e.printStackTrace();
            // You may throw an exception or log the error here.
        }
    }
    
    public ArrayList<Booking> getAllBooking() {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Booking";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int bookingId = rs.getInt(1);
                String bookDay = rs.getString(2);
                String timeStart = rs.getString(3);
                String timeEnd = rs.getString(4);
                int userId = rs.getInt(5);
                int pitchId = rs.getInt(6);
                
                Booking booking = new Booking(bookingId, bookDay, timeStart, timeEnd, userId, pitchId);
                bookings.add(booking);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // Handle database error
            e.printStackTrace();
            // You may throw an exception or log the error here.
        }
        return bookings;
    }
    
    
}
