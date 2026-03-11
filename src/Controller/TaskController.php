<?php
namespace App\Controller;

use App\Entity\Task;
use App\Form\TaskType;
use App\Service\TaskServiceInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/')]
class TaskController extends AbstractController
{
    public function __construct(private TaskServiceInterface $taskService) {}

    #[Route('/', name: 'task_index')]
    public function index(): Response
    {
        return $this->render('task/index.html.twig', [
            'tasks' => $this->taskService->findAll()
        ]);
    }

    #[Route('/new', name: 'task_new')]
    public function new(Request $request): Response
    {
        $task = new Task();
        $form = $this->createForm(TaskType::class, $task);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->taskService->create($task);
            return $this->redirectToRoute('task_index');
        }

        return $this->render('task/form.html.twig', [
            'form' => $form->createView()
        ]);
    }

    // ---------------  ----------------
    #[Route('/{id}', name: 'task_show', methods: ['GET'])]
    public function show(Task $task): Response
    {
        return $this->render('task/show.html.twig', ['task' => $task]);
    }

    #[Route('/{id}/edit', name: 'task_edit', methods: ['GET','POST'])]
    public function edit(Request $request, Task $task): Response
    {
        $form = $this->createForm(TaskType::class, $task);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->taskService->update();
            return $this->redirectToRoute('task_index');
        }

        return $this->render('task/form.html.twig', [
            'form' => $form->createView(),
            'edit' => true
        ]);
    }
    // ------------------------------------------------

    #[Route('/{id}/done', name: 'task_done')]
    public function done(Task $task): Response
    {
        $this->taskService->markAsDone($task);
        return $this->redirectToRoute('task_index');
    }

    #[Route('/{id}/delete', name: 'task_delete', methods: ['POST'])]
    public function delete(Request $request, Task $task): Response
    {
        if ($this->isCsrfTokenValid('delete'.$task->getId(), $request->request->get('_token'))) {
            $this->taskService->delete($task);
        }
        return $this->redirectToRoute('task_index');
    }
}