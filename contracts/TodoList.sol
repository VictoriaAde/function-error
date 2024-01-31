// SPDX-License-Identifier: NONE
pragma solidity ^0.8.9;

contract TodoList {
    struct Task {
        uint256 id;
        string content;
        bool completed;
        address creator;
    }

    mapping(uint256 => Task) public tasks;

    uint256 public taskCount;

    event TaskCreated(uint256 id, string content, bool completed, address creator);
    event TaskCompleted(uint256 id, bool completed);

    function createTask(string memory _content) public {
        if (bytes(_content).length == 0) {
                revert("Content cannot be empty"); 
        }        
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false, msg.sender);
        emit TaskCreated(taskCount, _content, false, msg.sender);
    }

    function toggleCompleted(uint256 _taskId) public {
        require(_taskId > 0 && _taskId <= taskCount, "Invalid taskId"); // Ensure taskId is valid
        Task storage task = tasks[_taskId];
        assert(task.id == _taskId); // task ID must match requested taskId
        task.completed = !task.completed;
        emit TaskCompleted(_taskId, task.completed);
    }
}