FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Install system dependencies required for psycopg2
RUN apt-get update && apt-get install -y libpq-dev

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run database migrations
RUN python manage.py migrate

# Expose the application's port
EXPOSE 8000

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
