<?php

namespace App\Entity;

use App\Repository\ProductRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProductRepository::class)]
class Product
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $title = null;

    #[ORM\Column(length: 255)]
    private ?string $subTitle = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    #[ORM\Column]
    private ?string $code = null;

    #[ORM\Column]
    private ?string $amount = null;

    #[ORM\Column(type: "decimal", precision: 7, scale: 2)]
    private ?float $price = null;

    #[ORM\ManyToOne(inversedBy: 'products')]
    private ?Measurement $measurement = null;

    #[ORM\ManyToOne(inversedBy: 'products')]
    private ?ProductCategory $category = null;

    #[ORM\ManyToMany(targetEntity: Image::class, inversedBy: 'products')]
    private Collection $images;

    #[ORM\Column(length: 2000, nullable: true)]
    private ?string $ingredients = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $recommended_use = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $storage_conditions = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $main_characteristics = null;

    public function __construct()
    {
        $this->images = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getSubTitle(): ?string
    {
        return $this->subTitle;
    }

    public function setSubTitle(?string $subTitle): static
    {
        $this->subTitle = $subTitle;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(string $code): static
    {
        $this->code = $code;

        return $this;
    }

    public function getAmount(): ?string
    {
        return $this->amount;
    }

    public function setAmount(string $amount): static
    {
        $this->amount = $amount;

        return $this;
    }

    public function getMeasurement(): ?Measurement
    {
        return $this->measurement;
    }

    public function setMeasurement(?Measurement $measurement): static
    {
        $this->measurement = $measurement;

        return $this;
    }

    public function getCategory(): ?ProductCategory
    {
        return $this->category;
    }

    public function setCategory(?ProductCategory $category): static
    {
        $this->category = $category;

        return $this;
    }

    public function __toString(): string
    {
        return $this->title;
    }

    /**
     * @return Collection<int, Image>
     */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(Image $image): static
    {
        if (!$this->images->contains($image)) {
            $this->images->add($image);
        }

        return $this;
    }

    public function removeImage(Image $image): static
    {
        $this->images->removeElement($image);

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(?float $price): void
    {
        $this->price = $price;
    }

    public function getIngredients(): ?string
    {
        return $this->ingredients;
    }

    public function setIngredients(?string $ingredients): static
    {
        $this->ingredients = $ingredients;

        return $this;
    }

    public function getRecommendedUse(): ?string
    {
        return $this->recommended_use;
    }

    public function setRecommendedUse(?string $recommended_use): static
    {
        $this->recommended_use = $recommended_use;

        return $this;
    }

    public function getStorageConditions(): ?string
    {
        return $this->storage_conditions;
    }

    public function setStorageConditions(?string $storage_conditions): static
    {
        $this->storage_conditions = $storage_conditions;

        return $this;
    }

    public function getMainCharacteristics(): ?string
    {
        return $this->main_characteristics;
    }

    public function setMainCharacteristics(?string $main_characteristics): static
    {
        $this->main_characteristics = $main_characteristics;

        return $this;
    }
}
