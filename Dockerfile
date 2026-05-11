# Step 1: Use an official Python base image
FROM python:3.9-slim

# Step 2: Set the directory where our app will live inside the container
WORKDIR /app

# Step 3: Copy the requirements file first (this speeds up builds)
COPY requirements.txt .

# Step 4: Install the libraries
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of your application code
COPY . .

# Step 6: Tell Docker which port the app runs on
EXPOSE 5000

# Step 7: The command to run your app
CMD ["python", "app.py"]