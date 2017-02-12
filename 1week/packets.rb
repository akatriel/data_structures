# Task. You are given a series of incoming network packets, and your task is to simulate their processing.
# Packets arrive in some order. For each packet number 𝑖, you know the time when it arrived 𝐴𝑖 and the
# time it takes the processor to process it 𝑃𝑖 (both in milliseconds). There is only one processor, and it
# processes the incoming packets in the order of their arrival. If the processor started to process some
# packet, it doesn’t interrupt or stop until it finishes the processing of this packet, and the processing of
# packet 𝑖 takes exactly 𝑃𝑖 milliseconds.
# The computer processing the packets has a network buffer of fixed size 𝑆. When packets arrive,
# they are stored in the buffer before being processed. However, if the buffer is full when a packet
# arrives (there are 𝑆 packets which have arrived before this packet, and the computer hasn’t finished
# processing any of them), it is dropped and won’t be processed at all. If several packets arrive at the
# same time, they are first all stored in the buffer (some of them may be dropped because of that —
# those which are described later in the input). The computer processes the packets in the order of
# their arrival, and it starts processing the next available packet from the buffer as soon as it finishes
# processing the previous one. If at some point the computer is not busy, and there are no packets in
# the buffer, the computer just waits for the next packet to arrive. Note that a packet leaves the buffer
# and frees the space in the buffer as soon as the computer finishes processing it.

input = []
ARGF.each_line do |line|
	break if line.chomp == ''
	input << line.split(' ').map{ |i| i.to_i }
end

line1 = input[0].split(' ')
input[0].shift
s = line1[0]
n = line1[1]

