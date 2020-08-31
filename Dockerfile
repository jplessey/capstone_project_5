FROM python:3.8-slim-buster

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static
COPY requirements.txt /app/
COPY Dockerfile /app/
COPY .env /app/

# Install packages from requirements.txt
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt
    
# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python", "app.py"]