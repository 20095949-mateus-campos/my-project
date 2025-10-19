FROM python:3.13
WORKDIR "/home/mateuscampos/Desktop/DBS/Semester 1/B9IS121 NETWORKS AND SYSTEMS ADMINISTRATION (B9IS121_2526_TMD1S)/CAs/CA1/my-project"

# Install the application dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy in the source code
COPY . ./src
EXPOSE 8080

# Setup an app user so the container doesn't run as the root user
RUN useradd app
USER app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]