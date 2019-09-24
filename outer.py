import os, subprocess, time

vars = [1, 2, 3]

with open('file', 'w+') as outfile:
    for file in os.listdir('./tests/'):
        if file.endswith('.py'):
            path = os.path.abspath(os.path.join('./tests',file))

            message = 'testing: ' +path.split('/')[-1]
            outfile.write('\n\n' +message)

            for i in range(len(vars)):
                outfile.write('\n' +'test ' +str(i+1) +' of ' +str(len(vars)) +': ' +str(vars[i]))
                with subprocess.Popen('python ' +path, stdin=subprocess.PIPE, stdout=subprocess.PIPE) as process:
                    outfile.write('\n' +'passing value as input: ' +str(vars[i]))
                    outdata = process.communicate(input=bytes(vars[i]))
                    outfile.write('\n' +str(outdata))