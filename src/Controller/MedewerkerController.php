<?php

namespace App\Controller;


use App\Entity\Activiteit;
use App\Entity\Soortactiviteit;
use App\Form\ActiviteitType;
use App\Form\SoortactiviteitType;
use App\Repository\SoortactiviteitRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\ResetType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class MedewerkerController extends AbstractController
{
    /**
     * @Route("/admin/activiteiten", name="activiteitenoverzicht")
     */
    public function activiteitenOverzichtAction()
    {

        $activiteiten=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->findAll();

        return $this->render('medewerker/activiteiten.html.twig', [
            'activiteiten'=>$activiteiten
        ]);
    }

    /**
     * @Route("/admin/details/{id}", name="details")
     */
    public function detailsAction($id)
    {
        $activiteiten=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->findAll();
        $activiteit=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->find($id);

        $deelnemers=$this->getDoctrine()
            ->getRepository('App:User')
            ->getDeelnemers($id);


        return $this->render('medewerker/details.html.twig', [
            'activiteit'=>$activiteit,
            'deelnemers'=>$deelnemers,
            'aantal'=>count($activiteiten)
        ]);
    }

    /**
     * @Route("/admin/beheer", name="beheer")
     */
    public function beheerAction()
    {
        $activiteiten=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->findAll();

        return $this->render('medewerker/beheer.html.twig', [
            'activiteiten'=>$activiteiten
        ]);
    }

    /**
     * @Route("/admin/add", name="add")
     */
    public function addAction(Request $request)
    {
        // create a user and a contact
        $a=new Activiteit();

        $form = $this->createForm(ActiviteitType::class, $a);
        $form->add('save', SubmitType::class, array('label'=>"voeg toe"));
        //$form->add('reset', ResetType::class, array('label'=>"reset"));

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager();
            $em->persist($a);
            $em->flush();

            $this->addFlash(
                'notice',
                'activiteit toegevoegd!'
            );
            return $this->redirectToRoute('beheer');
        }
        $activiteiten=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->findAll();
        return $this->render('medewerker/add.html.twig',array('form'=>$form->createView(),'naam'=>'toevoegen','aantal'=>count($activiteiten)
            ));
    }

    /**
     * @Route("/admin/update/{id}", name="update")
     */
    public function updateAction($id,Request $request)
    {
        $a=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->find($id);

        $form = $this->createForm(ActiviteitType::class, $a);
        $form->add('save', SubmitType::class, array('label'=>"aanpassen"));

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager();

            // tells Doctrine you want to (eventually) save the contact (no queries yet)
            $em->persist($a);


            // actually executes the queries (i.e. the INSERT query)
            $em->flush();
            $this->addFlash(
                'notice',
                'activiteit aangepast!'
            );
            return $this->redirectToRoute('beheer');
        }

        $activiteiten=$this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->findAll();

        return $this->render('medewerker/add.html.twig',array('form'=>$form->createView(),'naam'=>'aanpassen','aantal'=>count($activiteiten)));
    }

    /**
     * @Route("/admin/delete/{id}", name="delete")
     */
    public function deleteAction($id)
    {
        $em=$this->getDoctrine()->getManager();
        $a= $this->getDoctrine()
            ->getRepository('App:Activiteit')->find($id);
        $em->remove($a);
        $em->flush();

        $this->addFlash(
            'notice',
            'activiteit verwijderd!'
        );
        return $this->redirectToRoute('beheer');

    }

    /**
     * @Route("/admin/soorten/beheer", name="soortenbeheer")
     */
    public function beheerSoortenAction()
    {
        $soortActiviteiten=$this->getDoctrine()
            ->getRepository('App:Soortactiviteit')
            ->findAll();

        return $this->render('medewerker/soortactiviteit/beheer.html.twig', [
            'activiteiten'=>$soortActiviteiten
        ]);
    }
    /**
     * @Route("/admin/soorten/add", name="soortenadd")
     */
    public function addSoortenAction(Request $request)
    {
        // create a user and a contact
        $a=new Soortactiviteit();

        $form = $this->createForm(SoortactiviteitType::class, $a);
        $form->add('save', SubmitType::class, array('label'=>"voeg toe"));
        //$form->add('reset', ResetType::class, array('label'=>"reset"));

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager();
            $em->persist($a);
            $em->flush();

            $this->addFlash(
                'notice',
                'soort activiteit toegevoegd!'
            );
            return $this->redirectToRoute('soortenbeheer');
        }
        $soortActiviteiten=$this->getDoctrine()
            ->getRepository('App:Soortactiviteit')
            ->findAll();
        return $this->render('medewerker/soortactiviteit/add.html.twig',array('form'=>$form->createView(),'naam'=>'toevoegen','aantal'=>count($soortActiviteiten)
        ));
    }
    /**
     * @Route("/admin/soorten/delete/{id}", name="deleteSoort")
     */
    public function deleteSoortAction($id)
    {
        $em=$this->getDoctrine()->getManager();
        $a= $this->getDoctrine()
            ->getRepository('App:Soortactiviteit')->find($id);
        $em->remove($a);
        $em->flush();

        $this->addFlash(
            'notice',
            'soort activiteit verwijderd!'
        );
        return $this->redirectToRoute('soortenbeheer');

    }
    /**
     * @Route("/admin/soorten/update/{id}", name="updateSoort")
     */
    public function updateSoortAction($id,Request $request)
    {
        $a=$this->getDoctrine()
            ->getRepository('App:Soortactiviteit')
            ->find($id);

        $form = $this->createForm(SoortactiviteitType::class, $a);
        $form->add('save', SubmitType::class, array('label'=>"aanpassen"));

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager();

            // tells Doctrine you want to (eventually) save the contact (no queries yet)
            $em->persist($a);


            // actually executes the queries (i.e. the INSERT query)
            $em->flush();
            $this->addFlash(
                'notice',
                'soort activiteit aangepast!'
            );
            return $this->redirectToRoute('soortenbeheer');
        }

        $soortActiviteiten=$this->getDoctrine()
            ->getRepository('App:Soortactiviteit')
            ->findAll();

        return $this->render('medewerker/soortactiviteit/add.html.twig',
            array('form'=>$form->createView(),'naam'=>'aanpassen','aantal'=>count($soortActiviteiten)));
    }

    /**
     * @Route("/admin/deelnemers/beheer", name="deelnemersbeheer")
     */
    public function beheerDeelnemersAction()
    {
        $deelnemers=$this->getDoctrine()
            ->getRepository('App:User')
            ->findAll();

        return $this->render('medewerker/deelnemers/beheer.html.twig', [
            'deelnemers'=>$deelnemers
        ]);
    }

    /**
     * @Route("/admin/deelnemers/reset/{id}", name="resetPassword")
     */
    public function resetDeelnemerAction($id,Request $request, UserPasswordEncoderInterface $passwordEncoder)
    {
        $user=$this->getDoctrine()
            ->getRepository('App:User')
            ->find($id);

        $password = $passwordEncoder->encodePassword($user, 'qwerty');
        $user->setPassword($password);

        $em = $this->getDoctrine()->getManager();
        $em->persist($user);
        $em->flush();
        $this->addFlash(
            'notice',
            "Deelnemer's wachtwoord is gereset."
        );
        return $this->redirectToRoute('deelnemersbeheer');
    }
}
