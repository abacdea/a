TOR=336
LEAF=112
SPINE=64
TORU=48
LEAFU=16
SPINEU=4
TORP=7
LEAFP=7
SPINEP=16

for ((i=1;i<=${TORP};i++)){
	for ((j=1;j<=${TORU};j++)){
		mkdir tor${i}-${j}
		docker exec -it tor${i}-${j} ip -6 route show table all > ./tor${i}-${j}/v6route.txt
	}
}

for ((i=1;i<=${LEAFP};i++)){
	for ((j=1;j<=${LEAFU};j++)){
		mkdir leaf${i}-${j}
		docker exec -it leaf${i}-${j} ip -6 route show table all > ./leaf${i}-${j}/v6route.txt
	}
}

for ((i=1;i<=${SPINEP};i++)){
	for ((j=1;j<=${SPINEU};j++)){
		mkdir spine${i}-${j}
		docker exec -it spine${i}-${j} ip -6 route show table all > ./spine${i}-${j}/v6route.txt
	}
}
