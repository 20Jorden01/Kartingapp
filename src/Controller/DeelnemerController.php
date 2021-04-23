<?php

namespace App\Controller;


use App\Entity\User;
use App\Form\UserType;
use App\Form\UserType2;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\PasswordEncoderInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class DeelnemerController extends AbstractController
{
    /**
     * @Route("/user/activiteiten", name="activiteiten")
     */
    public function activiteitenAction()
    {
        $usr= $this->get('security.token_storage')->getToken()->getUser();

        $beschikbareActiviteiten=$this->getDoctrine()
            ->getRepository('App:Activiteit')
        ->getBeschikbareActiviteiten($usr->getId());

        $ingeschrevenActiviteiten=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->getIngeschrevenActiviteiten($usr->getId());

        $totaal=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->getTotaal($ingeschrevenActiviteiten);


        return $this->render('deelnemer/activiteiten.html.twig', [
                'beschikbare_activiteiten'=>$beschikbareActiviteiten,
                'ingeschreven_activiteiten'=>$ingeschrevenActiviteiten,
                'totaal'=>$totaal,
        ]);
    }

    /**
     * @Route("/user/inschrijven/{id}", name="inschrijven")
     */
    public function inschrijvenActiviteitAction($id)
    {

        $activiteit = $this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->find($id);
        $usr= $this->get('security.token_storage')->getToken()->getUser();
        $usr->addActiviteit($activiteit);

        $em = $this->getDoctrine()->getManager();
        $em->persist($usr);
        $em->flush();

        return $this->redirectToRoute('activiteiten');
    }

    /**
     * @Route("/user/uitschrijven/{id}", name="uitschrijven")
     */
    public function uitschrijvenActiviteitAction($id)
    {
        $activiteit = $this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->find($id);
        $usr= $this->get('security.token_storage')->getToken()->getUser();
        $usr->removeActiviteit($activiteit);
        $em = $this->getDoctrine()->getManager();
        $em->persist($usr);
        $em->flush();
        return $this->redirectToRoute('activiteiten');
    }

    /**
     * @Route("/user/profiel", name="profiel")
     */
    public function updateUserAction(Request $request, UserPasswordEncoderInterface $passwordEncoder)
    {
        $a= $this->get('security.token_storage')->getToken()->getUser();

        $form = $this->createForm(UserType2::class, $a);
        $form->add('save', SubmitType::class, array('label'=>"aanpassen"));

        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            if($a->getPlainPassword() != ""){
                $password = $passwordEncoder->encodePassword($a, $a->getPlainPassword());
                $a->setPassword($password);
            }
                $em = $this->getDoctrine()->getManager();

                // tells Doctrine you want to (eventually) save the contact (no queries yet)
                $em->persist($a);

                // actually executes the queries (i.e. the INSERT query)
                $em->flush();
                $this->addFlash(
                    'notice',
                    'Profiel aangepast!'
                );
                return $this->redirectToRoute('activiteiten');
        }

        $user=$this->getDoctrine()
            ->getRepository('App:User')
            ->findAll();

        return $this->render('deelnemer/profiel.html.twig',
            array('form'=>$form->createView(),'naam'=>'aanpassen','aantal'=>count($user)));
    }

}
