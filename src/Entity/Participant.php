<?php

namespace App\Entity;

use App\Repository\ParticipantRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @UniqueEntity("pseudo")
 * @ORM\Entity(repositoryClass=ParticipantRepository::class)
 */
class Participant implements UserInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @Assert\NotBlank(message="Merci de renseigner un nom")
     * @Assert\Length(max=30, maxMessage="30 caractères maximum")
     * @ORM\Column(type="string", length=30)
     */
    private $nom;

    /**
     * @Assert\NotBlank(message="Merci de renseigner un prénom")
     * @Assert\Length(max=30, maxMessage="30 caractères maximum")
     * @ORM\Column(type="string", length=30)
     */
    private $prenom;

    /**
     * @Assert\NotBlank(message="Merci de renseigner un pseudo")
     * @Assert\Length(max=30, maxMessage="30 caractères maximum")
     * @ORM\Column(type="string", length=30, unique=true)
     */
    private $pseudo;

    /**
     * @Assert\Length(min=15, minMessage="Ce champs doit être composé de 15 caractères", max=15, maxMessage="Ce champs doit être composé de 15 caractères")
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    private $telephone;

    /**
     * @Assert\Email(message="L'email '{{value}}' n'est pas un email valide")
     * @Assert\Length(max=30, maxMessage="30 caractère maximum")
     * @ORM\Column(type="string", length=30)
     */
    private $mail;

    /**
     * @Assert\Regex(
     *     pattern="^\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])(?=\S*[\W])\S*$",
     *     match=false,
     *     message="Le mot de passe doit contenir au moins 8 caractères, dont une majuscule, une minuscule, un chiffre et un caractère spécial")
     * @Assert\Length(max=255, maxMessage="255 caractères maxinum")
     * @ORM\Column(type="string", length=255)
     */
    private $motPasse;

    /**
     * @ORM\Column(type="boolean")
     */
    private $administrateur = false;

    /**
     * @ORM\Column(type="boolean")
     */
    private $actif = true;


    private $roles;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Sortie", mappedBy="participants")
     */
    private $sorties;

    public function __construct()
    {
        $this->sorties = new ArrayCollection();
    }

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Campus", inversedBy="participants")
     */
    private $campus;


    public function getIdParticipant(): ?int
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * @param mixed $nom
     */
    public function setNom($nom): void
    {
        $this->nom = $nom;
    }

    /**
     * @return mixed
     */
    public function getPrenom()
    {
        return $this->prenom;
    }

    /**
     * @param mixed $prenom
     */
    public function setPrenom($prenom): void
    {
        $this->prenom = $prenom;
    }

    /**
     * @param mixed $pseudo
     */
    public function setPseudo($pseudo): void
    {
        $this->pseudo = $pseudo;
    }

    /**
     * @return mixed
     */
    public function getTelephone()
    {
        return $this->telephone;
    }

    /**
     * @param mixed $telephone
     */
    public function setTelephone($telephone): void
    {
        $this->telephone = $telephone;
    }

    /**
     * @return mixed
     */
    public function getMail()
    {
        return $this->mail;
    }

    /**
     * @param mixed $mail
     */
    public function setMail($mail): void
    {
        $this->mail = $mail;
    }

    /**
     * @param mixed $motPasse
     */
    public function setMotPasse($motPasse): void
    {
        $this->motPasse = $motPasse;
    }

    /**
     * @return mixed
     */
    public function getAdministrateur()
    {
        return $this->administrateur;
    }

    /**
     * @param mixed $administrateur
     */
    public function setAdministrateur($administrateur): void
    {
        $this->administrateur = $administrateur;
    }

    /**
     * @return mixed
     */
    public function getActif()
    {
        return $this->actif;
    }

    /**
     * @param mixed $actif
     */
    public function setActif($actif): void
    {
        $this->actif = $actif;
    }

    /**
     * @return mixed
     */
    public function getSorties()
    {
        return $this->sorties;
    }

    /**
     * @param mixed $sorties
     */
    public function setSorties($sorties): void
    {
        $this->sorties = $sorties;
    }

    /**
     * @return mixed
     */
    public function getCampus()
    {
        return $this->campus;
    }

    /**
     * @param mixed $campus
     */
    public function setCampus($campus): void
    {
        $this->campus = $campus;
    }

    public function getRoles()
    {
        return ["ROLE_USER"];
    }

    public function getPassword()
    {
        return $this->motPasse;
    }

    public function getUsername(): string
    {
        return (string) $this->pseudo;
    }

    public function getSalt(){return null;}

    public function eraseCredentials(){}

}
