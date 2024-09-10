# **Video Streaming from Laptop to Raspberry Pi 5**

This guide provides instructions for setting up a video streaming system where a laptop's camera streams video to a Raspberry Pi 5. The Raspberry Pi displays the video feed and allows capturing images and videos interactively.

## **Overview**

1. **Install and Configure FFmpeg on Windows (Laptop)**
2. **Configure the Raspberry Pi 5**
3. **Set Up Video Streaming from Laptop**
4. **Receive and Display Video Stream on Raspberry Pi**
5. **Capture Images and Videos**

## **Step 1: Install and Configure FFmpeg on Windows (Laptop)**

### 1.1. Install FFmpeg

1. Open Command Prompt on your Windows laptop.

2. Install FFmpeg using `winget`:

   ```bash
   winget install ffmpeg
   ```

3. Verify the installation:

   ```bash
   ffmpeg -version
   ```

### 1.2. List Available Cameras

1. Open Command Prompt.

2. List available cameras:

   ```bash
   ffmpeg -list_devices true -f dshow -i dummy
   ```

   Find your camera name from the output.

### 1.3. Configure FFmpeg for Streaming

1. Start streaming from your laptop's camera to the Raspberry Pi:

   ```bash
   ffmpeg -f dshow -i video="Your Camera Name" -vcodec libx264 -preset ultrafast -tune zerolatency -b:v 1500k -f mpegts udp://<Raspberry_Pi_IP>:1234
   ```

   - Replace `"Your Camera Name"` with the exact name of your camera device.
   - Replace `<Raspberry_Pi_IP>` with the IP address of your Raspberry Pi.

   **Explanation:**
   - `-f dshow`: Specifies the DirectShow input (for Windows).
   - `-i video="Your Camera Name"`: Input device name.
   - `-vcodec libx264`: H.264 video codec.
   - `-preset ultrafast`: Minimizes encoding latency.
   - `-tune zerolatency`: Further reduces latency.
   - `-b:v 1500k`: Sets video bitrate to 1500 kbps.
   - `-f mpegts`: Outputs in MPEG-TS format suitable for UDP.
   - `udp://<Raspberry_Pi_IP>:1234`: Destination IP and port for the stream.

## **Step 2: Configure the Raspberry Pi 5**

### 2.1. Update and Upgrade Raspberry Pi

1. Open Terminal on your Raspberry Pi.

2. Update the package list:

   ```bash
   sudo apt update
   ```

3. Upgrade installed packages:

   ```bash
   sudo apt upgrade -y
   ```

### 2.2. Install Required Software

1. Install FFmpeg:

   ```bash
   sudo apt install ffmpeg
   ```

2. Install OpenCV (if not already installed):

   ```bash
   sudo apt install python3-opencv
   ```

## **Step 3: Set Up Video Streaming from Laptop**

Ensure your FFmpeg command from Step 1.3 is running on the laptop to stream video to the Raspberry Pi.

## **Step 4: Receive and Display Video Stream on Raspberry Pi**

### 4.1. Create a Python Script

1. Open Terminal on your Raspberry Pi.

2. Create a Python script file:

   ```bash
   nano receive_stream.py
   ```

3. Paste the following Python code into `receive_stream.py`:

   ```python
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
   ```

4. Save and exit (press `Ctrl+X`, then `Y`, and `Enter`).

### 4.2. Run the Python Script

Execute the script:

```bash
python3 receive_stream.py
```

## **Checking UDP Port**

To ensure that the UDP port (1234) is open and accepting connections, you can use tools like `netcat` on the Raspberry Pi:

1. Open Terminal on your Raspberry Pi.

2. Install `netcat` if not already installed:

   ```bash
   sudo apt install netcat
   ```

3. Check if the port is open:

   ```bash
   nc -ul 1234
   ```

   This command will listen for incoming UDP traffic on port 1234. If you see no output but the command is running, the port is open and listening.

## **Troubleshooting**

- **Latency Issues**: Adjust FFmpeg encoding options or network buffer sizes.
- **Connection Problems**: Verify IP addresses and ensure both devices are on the same network.
- **Video Quality**: Tune the bitrate and resolution settings in FFmpeg for better quality.
- **Camera Detection**: Ensure that the camera is properly connected and recognized by the laptop.

By following these steps, you should be able to set up a low-latency video streaming system from your laptop’s camera to a Raspberry Pi 5, with interactive options for capturing images and saving videos.

--- 

- by Aditya Kumar