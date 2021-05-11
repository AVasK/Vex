import numpy as np

timings = {}
filename = input('filename: ')
with open(filename) as file:
    for line in file:
        caption, time = line.split(': ')
        time = int(time.split()[0])
        caption = caption.split()[0]
        if caption in timings.keys():
            timings[caption].append(time)
        else:
            timings[caption] = [time]


for key in timings.keys():
    values = np.array(timings[key])
    mean = values.mean()
    M = values.max()
    m = values.min()
    timings[key] = (m, mean, M)


with open(f'stat_{filename}', 'w') as f:
    for key in timings.keys():
        f.write(f'{key}: {timings[key]}\n')