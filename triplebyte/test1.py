
class tictacobj:
    def __init__(self):
        self.turn = 0
        self.modes = ['X', 'O']
        self.state = ['-','-','-','-','-','-','-','-','-']

    def printboard(self):
        print(self.state[0]+'|'+self.state[1]+'|'+self.state[2])
        print(self.state[3]+'|'+self.state[4]+'|'+self.state[5])
        print(self.state[6]+'|'+self.state[7]+'|'+self.state[8])
        print()

    def if_full(self):
        return '-' not in self.state

    def automove(self):
        mode = self.modes[int(self.turn)]
        self.turn = not self.turn
        target = 0
        for i in range(len(self.state)):
            if self.state[i] == '-':
                target = i
                break
        self.addtoken(i , mode)

    def addtoken(self, position, mode):
        if self.if_full():
            raise Exception('No Valid Moves!')

        if mode not in self.modes:
            print('not allowed')
            return False

        if self.state[position] not in self.modes:
            self.state[position] = mode
        else:
            print('already', mode)

tictac = tictacobj()

# Manual mode
# tictac.printboard()
# tictac.addtoken(0, 'X')
# tictac.printboard()
# tictac.addtoken(1, 'X')
# tictac.printboard()
# tictac.addtoken(2, 'X')
# tictac.printboard()
# tictac.addtoken(3, 'X')
# tictac.printboard()
# tictac.addtoken(4, 'X')
# tictac.printboard()
# tictac.addtoken(5, 'X')
# tictac.printboard()
# tictac.addtoken(6, 'X')
# tictac.printboard()
# tictac.addtoken(7, 'X')
# tictac.printboard()
# tictac.addtoken(8, 'X')
# tictac.printboard()
# tictac.addtoken(9, 'X')
# tictac.printboard()
# tictac.addtoken(1, 'X')
# tictac.printboard()

# Automode
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.automove()
tictac.printboard()
tictac.automove()
tictac.printboard()