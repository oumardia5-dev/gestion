<?php

namespace App\Service;

use App\Entity\Task;
use App\Repository\TaskRepository;
use Doctrine\ORM\EntityManagerInterface;

class TaskService implements TaskServiceInterface
{
    public function __construct(
        private EntityManagerInterface $em,
        private TaskRepository $repository
    ) {}

    public function create(Task $task): void
    {
        $this->em->persist($task);
        $this->em->flush();
    }

    public function update(): void
    {
        $this->em->flush();
    }

    public function delete(Task $task): void
    {
        $this->em->remove($task);
        $this->em->flush();
    }

    public function markAsDone(Task $task): void
    {
        $task->markAsDone();
        $this->em->flush();
    }

    public function findAll(): array
    {
        return $this->repository->findAll();
    }
}