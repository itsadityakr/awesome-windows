import cv2
import datetime

# Define the URL of the stream
stream_url = 'udp://@0.0.0.0:1234'

# Open the video capture from the UDP stream
cap = cv2.VideoCapture(stream_url, cv2.CAP_FFMPEG)

if not cap.isOpened():
    print("Error: Could not open video stream.")
    exit()

# Reduce buffer size to minimize latency
cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)

# Define codec and create VideoWriter object for saving video
fourcc = cv2.VideoWriter_fourcc(*'XVID')
out = None

# Initialize variables for frame capture
capturing = False

while True:
    ret, frame = cap.read()

    if not ret:
        print("Error: Could not read frame.")
        break

    # Display the resulting frame
    cv2.imshow('Video Stream', frame)

    key = cv2.waitKey(1) & 0xFF

    # Save image when 's' is pressed
    if key == ord('s'):
        image_filename = f"image_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.jpg"
        cv2.imwrite(image_filename, frame)
        print(f"Image saved as {image_filename}")

    # Start/stop saving video when 'v' is pressed
    elif key == ord('v'):
        if not capturing:
            # Start capturing video
            video_filename = f"video_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.avi"
            out = cv2.VideoWriter(video_filename, fourcc, 20.0, (frame.shape[1], frame.shape[0]))
            capturing = True
            print(f"Video recording started. Saving to {video_filename}")
        else:
            # Stop capturing video
            capturing = False
            out.release()
            print(f"Video recording stopped. File saved.")
    
    # Quit the application when 'q' is pressed
    elif key == ord('q'):
        break

    # Write the frame to the video file if recording
    if capturing and out is not None:
        out.write(frame)

# Release resources
cap.release()
if out is not None:
    out.release()
cv2.destroyAllWindows()