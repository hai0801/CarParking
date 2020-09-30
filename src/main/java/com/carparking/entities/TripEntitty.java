package main.java.com.carparking.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "Trip")
public class TripEntitty implements Serializable {
    
    /** The Constant serialVersionUID. */
    private static final long serialVersionUID = 1L;

    /** The trip id. */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trip_id", unique = true, nullable = false, length = 20)
    private long tripId;

    /** The booked ticket number. */
    @Column(name = "booked_ticket_number")
    @Min(value = 0)
    private Integer bookedTicketNumber;

    /** The car type. */
    @Column(name = "car_type", nullable = false, length = 50)
    @NotBlank
    @Length(max = 50, message = "Please enter 1 to 50 characters including letters and numbers.")
    @Pattern(regexp = "^[a-zA-Z0-9 ]*$")
    private String carType;

    /** The departure date. */
    @Column(name = "departure_date", nullable = false)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Temporal(TemporalType.DATE)
    @NotNull(message = "This field is required.")
    @Past(message = "Invalid input. Please enter before the current date.")
    private Date departureDate;

    /** The departure time. */
    @Column(name = "departure_time", nullable = false)
    @NotNull(message = "This field is required.")
    @Pattern(regexp = "^([0-1][0-9]|[2][0-3]):([0-5][0-9])$", message = "Invalid input, please enter again (24 format hh: mm).")
    private String departureTime;

    /** The destination. */
    @Column(nullable = false, length = 50)
    @NotBlank
    @Length(max = 50, message = "Please enter 1 to 50 characters including letters and numbers.")
    @Pattern(regexp = "^[a-zA-Z0-9 ]*$")
    private String destination;

    /** The driver. */
    @Column(nullable = false, length = 50)
    @NotBlank
    @Length(max = 50, message = "Please enter 1 to 50 characters including letters and numbers.")
    @Pattern(regexp = "^[a-zA-Z0-9 ]*$")
    private String driver;

    /** The maximum online ticket number. */
    @Range(min = 0, max = 45, message = "Please input data between min and max.")
    @Column(name = "maximum_online_ticket_number", nullable = false)
    @NotNull(message = "Please select online ticket number.")
    private Integer maximumOnlineTicketNumber;

    /**
     * Sets the departure time.
     *
     * @param departureTime the new departure time
     */
    public void setDepartureTime(String departureTime) {
        if (departureTime != null) {
            if (departureTime.trim().equals("")) {
                this.departureTime = null;
            } else {
                this.departureTime = departureTime;
            }
        } else {
            this.departureTime = departureTime;
        }
    }

	public long getTripId() {
		return tripId;
	}

	public void setTripId(long tripId) {
		this.tripId = tripId;
	}

	public Integer getBookedTicketNumber() {
		return bookedTicketNumber;
	}

	public void setBookedTicketNumber(Integer bookedTicketNumber) {
		this.bookedTicketNumber = bookedTicketNumber;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public Integer getMaximumOnlineTicketNumber() {
		return maximumOnlineTicketNumber;
	}

	public void setMaximumOnlineTicketNumber(Integer maximumOnlineTicketNumber) {
		this.maximumOnlineTicketNumber = maximumOnlineTicketNumber;
	}

	public String getDepartureTime() {
		return departureTime;
	}
}
