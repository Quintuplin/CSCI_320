from threading import Thread, Event

exitloop = Event()

def exiter():
    input()
    exitloop.set()

ET = Thread(name = "exit check", target=exiter, args=())

ET.start()

while not exitloop.wait(timeout=.5):
    print('stsmt')
