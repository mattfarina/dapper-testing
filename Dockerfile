FROM registry.suse.com/bci/golang:1.21 as build

WORKDIR /go/src/
COPY *.go .
COPY go.mod .
RUN go build -o /bin/hello ./main.go

FROM scratch
COPY --from=build /bin/hello /bin/hello
CMD ["/bin/hello"]