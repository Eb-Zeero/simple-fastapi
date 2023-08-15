# Use the official Python image as the base image
FROM python:3.9-slim

# Set environment variables to prevent buffering of Python output
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Install poetry globally
RUN pip install poetry

# Copy the poetry.lock and pyproject.toml files into the container
COPY ./pyproject.toml ./poetry.lock ./

RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

RUN pip uninstall -y poetry

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the FastAPI app files into the container
COPY . .

# Expose the port that the FastAPI app will run on
EXPOSE 8000

# Command to run the FastAPI app using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
