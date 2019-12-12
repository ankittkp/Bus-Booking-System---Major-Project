import socket
from threading import Thread

from past.builtins import raw_input


class ClientThread(Thread):
	def  __init__(self,ip,port):
		Thread.__init__(self)
		self.ip=ip
		self.port=port
		# print "[+] New server socket thread started for "+ ip +":"+str(port)

		def run(self):
			while True:
				data=conn.recv(2048)
				# print "Server received data:", data
				MESSAGE=raw_input("Multi threaded server: Enter response from server/enter exit:")
				if MESSAGE == 'exit':
					break
				conn.send(MESSAGE) #echo

TCP_IP='192.168.43.244'
TCP_PORT= 8000


BUFFER_SIZE=2000 # usually 1024 but we need quick response
tcpServer=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
tcpServer.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
tcpServer.bind((TCP_IP,TCP_PORT))
threads=[]

while True:
	tcpServer.listen(4)
	# print"multithreaded python server : waiting for conncetions from tcp clients..."
	(conn,(ip,port))=tcpServer.accept()
	newthread=ClientThread(ip, port)
	newthread.start()
	threads.append(newthread)

for t in thraeds:
	t.join()