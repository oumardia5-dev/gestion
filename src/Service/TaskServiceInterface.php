<?php

namespace App\Service;

use App\Entity\Task;

interface TaskServiceInterface
{
    public function create(Task $task): void;
    public function update(): void;
    public function delete(Task $task): void;
    public function markAsDone(Task $task): void;
    public function findAll(): array;
}