<?php

namespace App\Entity;

use App\Repository\ImageRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ImageRepository::class)]
class Image
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $location = null;

    #[ORM\ManyToMany(targetEntity: ProductsImages::class, mappedBy: 'images')]
    private Collection $productsImages;

    public function __construct()
    {
        $this->productsImages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLocation(): ?string
    {
        return $this->location;
    }

    public function setLocation(string $location): static
    {
        $this->location = $location;

        return $this;
    }

    /**
     * @return Collection<int, ProductsImages>
     */
    public function getProductsImages(): Collection
    {
        return $this->productsImages;
    }

    public function addProductsImage(ProductsImages $productsImage): static
    {
        if (!$this->productsImages->contains($productsImage)) {
            $this->productsImages->add($productsImage);
            $productsImage->addImage($this);
        }

        return $this;
    }

    public function removeProductsImage(ProductsImages $productsImage): static
    {
        if ($this->productsImages->removeElement($productsImage)) {
            $productsImage->removeImage($this);
        }

        return $this;
    }

    public function __toString(): string
    {
        return $this->location;
    }
}
