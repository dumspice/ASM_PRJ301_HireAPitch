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
import model.BookingStuff;
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
            e.printStackTrace();
        }
    }
    
    public ArrayList<Booking> getBookingByUP(int userId, int pitchId) {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Booking WHERE [User_id] = ? AND Pitch_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, pitchId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt(1));
                booking.setBookDay(rs.getString(2));
                booking.setTimeStart(rs.getString(3));
                booking.setTimeEnd(rs.getString(4));
                booking.setUserId(rs.getInt(5));
                booking.setPitchId(rs.getInt(6));
                booking.setStatus(rs.getBoolean(7));
                bookings.add(booking);
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    public Booking getBookingById(int bookingId) {
    try {
        String sql = "SELECT * FROM Booking WHERE Booking_id = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, bookingId);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            Booking booking = new Booking();
            booking.setBookingId(rs.getInt("Booking_id"));
            booking.setBookDay(rs.getString("Book_day"));
            booking.setTimeStart(rs.getString("Time_start"));
            booking.setTimeEnd(rs.getString("Time_end"));
            booking.setUserId(rs.getInt("User_id"));
            booking.setPitchId(rs.getInt("Pitch_id"));
            booking.setStatus(rs.getBoolean("Status"));
            return booking;
        }

        rs.close();
        st.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
    
    public void confirmBooking(int bookingId) {
        try {
            String sql = "UPDATE Booking SET [Status] = 1 WHERE Booking_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void delete(int id) {
        try {
            String sql = "DELETE FROM Booking WHERE Booking_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
            st.close();
        } catch (Exception e) {
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
                boolean status = rs.getBoolean(7);
                
                Booking booking = new Booking(bookingId, bookDay, timeStart, timeEnd, userId, pitchId, status);
                bookings.add(booking);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    public Booking getNewBooking() {
        try {
            String sql = "SELECT TOP 1 *\n"
                        + "FROM Booking\n"
                        + "ORDER BY Booking_id DESC;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int bookingId = rs.getInt(1);
                String bookDay = rs.getString(2);
                String timeStart = rs.getString(3);
                String timeEnd = rs.getString(4);
                int userId = rs.getInt(5);
                int pitchId = rs.getInt(6);
                
                Booking booking = new Booking(bookingId, bookDay, timeStart, timeEnd, userId, pitchId);
                return booking;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
// BookingStuffDetails
    public void insert(BookingStuff bookingStuff) {
        try {
            String sql = "INSERT INTO Booking_Stuff_detail (Booking_id, Stuff_id, Amount) VALUES (?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingStuff.getBooking_id());
            st.setInt(2, bookingStuff.getStuff_id());
            st.setInt(3, bookingStuff.getAmount());
            
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public BookingStuff getExistBookingStuff(int bookingId, int stuffId) {
        try {
            String sql = "SELECT * FROM Booking_Stuff_detail WHERE Booking_id = ? AND Stuff_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            st.setInt(2, stuffId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                BookingStuff bookingStuff = new BookingStuff();
                bookingStuff.setBooking_id(rs.getInt(1));
                bookingStuff.setStuff_id(rs.getInt(2));
                bookingStuff.setAmount(rs.getInt(3));
                return bookingStuff;
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<BookingStuff> getBookingStuffByBookingId(int bookingId) {
        ArrayList<BookingStuff> list = new ArrayList();
        try {
            String sql = "SELECT * FROM Booking_Stuff_detail WHERE Booking_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                BookingStuff bookingStuff = new BookingStuff();
                bookingStuff.setBooking_id(rs.getInt(1));
                bookingStuff.setStuff_id(rs.getInt(2));
                bookingStuff.setAmount(rs.getInt(3));
                list.add(bookingStuff);
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteBookingStuff(int bookingId, int stuffId) {
        try {
            String sql = "DELETE FROM Booking_Stuff_detail WHERE Booking_id = ? AND Stuff_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            st.setInt(2, stuffId);

            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public void update(BookingStuff existingBookingStuff) {
        try {
            String sql = "UPDATE Booking_Stuff_detail SET Amount = ? WHERE Booking_id = ? AND Stuff_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, existingBookingStuff.getAmount());
            st.setInt(2, existingBookingStuff.getBooking_id());
            st.setInt(3, existingBookingStuff.getStuff_id());
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
