#!/usr/bin/env python3

# Default color levels for the color cube
cubelevels = [0x00, 0x5f, 0x87, 0xaf, 0xd7, 0xff]
# Generate a list of midpoints of the above list
snaps = [(x+y)/2 for x, y in zip(cubelevels, [0]+cubelevels)][1:]


def rgb2short(r, g, b):
    """ Converts RGB values to the nearest equivalent xterm-256 color."""
    # Using list of snap points, convert RGB value to cube indexes
    r, g, b = map(lambda x: len(tuple(s for s in snaps if s < x)), (r, g, b))
    # Simple colorcube transform
    return r*36 + g*6 + b + 16


def split_into(s, l):
    return [int(s[1][y-l:y], 16) for y in range(l, len(s[1]) + l, l)]


def main():
    """ Pass either 1 hex rgb string or split into 3."""
    import sys
    if len(sys.argv) < 3:
        args = split_into(sys.argv, 2)
    else:
        args = sys.argv
    print(rgb2short(args[0], args[1], args[2]))


if __name__ == '__main__':
    main()
