<?php

namespace App\Entity;

use App\Repository\ImageRepository;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\Validator\Constraints as Assert;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

#[Vich\Uploadable]
#[ORM\Entity(repositoryClass: ImageRepository::class)]
class Image
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[Vich\UploadableField(mapping:"product_images", fileNameProperty:"imageName")]
    #[Assert\File()]
    private File $imageFile;

    #[ORM\Column(type:"string", nullable:false)]
    private ?string $imageName = null;

    #[ORM\Column(type:"datetime")]
    private DateTime $updatedAt;

    #[ORM\ManyToOne(inversedBy: 'images')]
    private ?Product $product = null;

    #[ORM\ManyToMany(targetEntity: Product::class, mappedBy: 'images')]
    private Collection $products;

    public function __construct()
    {
        $this->products = new ArrayCollection();
    }

    public function getImageFile(): File
    {
        return $this->imageFile;
    }

    /**
     *
     * @param File|null $image
     * @return Image
     */
    public function setImageFile(File $image = null): Image
    {
        $this->imageFile = $image;
        if ($image instanceof File) {
            $this->updatedAt = new DateTime();
        }
        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Set updatedAt
     *
     * @param DateTime $updatedAt
     *
     * @return Image
     */
    public function setUpdatedAt(DateTime $updatedAt): static
    {
        $this->updatedAt = $updatedAt;
        return $this;
    }
    /**
     * Get updatedAt
     *
     * @return DateTime
     */
    public function getUpdatedAt(): DateTime
    {
        return $this->updatedAt;
    }

    /**
     * Set imageName
     *
     * @param string|null $imageName
     *
     * @return Image
     */
    public function setImageName(?string $imageName): static
    {
        $this->imageName = $imageName;
        return $this;
    }
    /**
     * Get imageName
     *
     * @return string|null
     */
    public function getImageName(): ?string
    {
        return $this->imageName;
    }

    public function __toString(): string
    {
        return $this->imageName;
    }

    public function getProduct(): ?Product
    {
        return $this->product;
    }

    public function setProduct(?Product $product): static
    {
        $this->product = $product;

        return $this;
    }

    /**
     * @return Collection<int, Product>
     */
    public function getProducts(): Collection
    {
        return $this->products;
    }

    public function addProduct(Product $product): static
    {
        if (!$this->products->contains($product)) {
            $this->products->add($product);
            $product->addImage($this);
        }

        return $this;
    }

    public function removeProduct(Product $product): static
    {
        if ($this->products->removeElement($product)) {
            $product->removeImage($this);
        }

        return $this;
    }
}
