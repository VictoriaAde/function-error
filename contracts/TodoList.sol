// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract TodoList {
    struct Task {
        string description;
        bool completed;
    }

    // declares a public array named tasks of type Task
    Task[] public tasks;

    event TaskCreated(string description);
    event TaskCompleted(uint256 taskId);

    function createTask(string memory _description) public {        
        if (bytes(_description).length == 0) {
            revert("Description cannot be empty");
        }
        tasks.push(Task(_description, false));
        emit TaskCreated(_description);
    }

    function completeTask(uint256 _taskId) public {
        require(_taskId < tasks.length, "Task does not exist");
        require(!tasks[_taskId].completed, "Task already completed");

        tasks[_taskId].completed = true;
        emit TaskCompleted(_taskId);
    }

    function viewAllTasks() public view returns (string[] memory) {
        string[] memory allTasks = new string[](tasks.length);

        for (uint256 i = 0; i < tasks.length; i++) {
            allTasks[i] = tasks[i].description;
        }
        
        return allTasks;
    }

}
