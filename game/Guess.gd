extends Node
class_name Guess

var answer
var guess_times
var finished
var success
var results


func _init():
    randomize()
    restart()
    
func restart():
    guess_times = 0
    results = []
    finished = false
    success = false
    generate_answer()
    
func generate_answer():
    var temp = range(10)
    temp.shuffle()
    answer = []
    for i in range(4):
        answer.append(temp[i])

func test_answer(nums):
    var temp = nums.duplicate()
    temp.sort()
    for i in range(3):
        if temp[i] == temp[i+1]:
            return false
    return true
    
# if this function return null, 
# then game is finished or the answer is not illegal
func guess(nums):
#    print("answer is:",answer)
#    print("guess:",nums)
    if finished:
        return null
    
    var t_num = 0
    var m_num = 0
    if test_answer(nums):
        guess_times += 1
    else:
        return null
    
    for i in range(4):
        if not nums[i] in answer:
            continue
        if nums[i] == answer[i]:
            t_num += 1
        else:
            m_num += 1
    var v = Vector2(t_num,m_num)
    results.append(v)
    
    if t_num == 4:
        finished = true
        success = true
    if guess_times == 10:
        finished = true

    return v
    
    
func get_answer():
    return answer