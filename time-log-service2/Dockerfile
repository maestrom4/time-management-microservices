# Start with the official Go image to build the Go binary.
FROM golang:1.19 AS builder

# Set the Current Working Directory inside the container.
WORKDIR /app

# Copy go.mod and go.sum to download dependencies.
# This is done before copying the source code to leverage Docker cache.
COPY go.* ./
RUN go mod download

# Copy the source code into the container.
COPY ./cmd/service/main.go ./cmd/service/

# Build the Go app.
# Adjust the path to where your main.go is accordingly.
RUN CGO_ENABLED=0 GOOS=linux go build -o /time-log-service ./cmd/service/main.go

# Start a new stage from scratch for a lean final image.
FROM alpine:latest

WORKDIR /

# Copy the pre-built binary file from the previous stage.
COPY --from=builder /time-log-service /time-log-service

# Expose port 8080 to the outside world.
EXPOSE 8080

# Command to run the executable.
CMD ["/time-log-service"]
