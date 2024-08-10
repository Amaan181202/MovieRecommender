# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables to prevent Python from writing pyc files to disc
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1


# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/requirements.txt

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Streamlit
RUN pip install --no-cache-dir streamlit

# Copy the rest of the application code into the container at /app
COPY app.py /app/
COPY movie.pkl /app/
COPY similar.pkl /app/

# Copy any other required files
COPY Procfile /app/

EXPOSE 8051

# Specify the command to run on container start
CMD ["streamlit", "run", "app.py"]
