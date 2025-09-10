extends CanvasLayer

func update_score(score):
	$scoreLabel.text = "Score:" + str(score)

func message(message):
	$mainTitle.show()
	$mainTitle.text = message
	$messageTimer.start()
	await $messageTimer.timeout
	$mainTitle.hide()

func startMessage():
	$mainTitle.show()
	$mainTitle.text = "3"
	$messageTimer.start()
	await $messageTimer.timeout
	
	$mainTitle.text = "2"
	$messageTimer.start()
	await $messageTimer.timeout
	
	$mainTitle.text = "1"
	$messageTimer.start()
	await $messageTimer.timeout
	
	$mainTitle.text = "GOOO"
	$messageTimer.start()
	await $messageTimer.timeout
	$mainTitle.hide()
