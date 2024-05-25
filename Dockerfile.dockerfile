# Dockerfile
FROM python:3

WORKDIR /usr/src/librarygenesis

# Download and unpack the LibraryGenesis repository in one step, handling directory contents carefully
RUN wget -O librarygenesis.zip "https://github.com/hype-armor/LibraryGenesis/archive/refs/heads/main.zip" && \
    unzip librarygenesis.zip && \
    rm librarygenesis.zip && \
    find LibraryGenesis-main/ -mindepth 1 -maxdepth 1 -exec mv {} . \; && \
    rmdir LibraryGenesis-main

# Install required Python libraries from the unpacked requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Ensure the downloads directory exists
RUN mkdir -p /downloads

# Expose port 8003 for external access
EXPOSE 8003

# Command to run the Python server
CMD ["python", "./server.py"]
