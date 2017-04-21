
all: proto/pbhead.pb proto/pblogin.pb proto/messages.pb

proto/pbhead.pb: proto/pbhead.proto
	protoc --descriptor_set_out proto/pbhead.pb proto/pbhead.proto

proto/pblogin.pb: proto/pblogin.proto
	protoc --descriptor_set_out proto/pblogin.pb proto/pblogin.proto

proto/messages.pb: proto/messages.proto
	protoc --descriptor_set_out proto/messages.pb proto/messages.proto