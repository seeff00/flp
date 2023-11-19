<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231119052506 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE products_images_image (products_images_id INT NOT NULL, image_id INT NOT NULL, INDEX IDX_8F22724D8632E6C3 (products_images_id), INDEX IDX_8F22724D3DA5256D (image_id), PRIMARY KEY(products_images_id, image_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE products_images_image ADD CONSTRAINT FK_8F22724D8632E6C3 FOREIGN KEY (products_images_id) REFERENCES products_images (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE products_images_image ADD CONSTRAINT FK_8F22724D3DA5256D FOREIGN KEY (image_id) REFERENCES image (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE products_images DROP FOREIGN KEY FK_662C35403DA5256D');
        $this->addSql('DROP INDEX IDX_662C35403DA5256D ON products_images');
        $this->addSql('ALTER TABLE products_images DROP image_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE products_images_image DROP FOREIGN KEY FK_8F22724D8632E6C3');
        $this->addSql('ALTER TABLE products_images_image DROP FOREIGN KEY FK_8F22724D3DA5256D');
        $this->addSql('DROP TABLE products_images_image');
        $this->addSql('ALTER TABLE products_images ADD image_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE products_images ADD CONSTRAINT FK_662C35403DA5256D FOREIGN KEY (image_id) REFERENCES image (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_662C35403DA5256D ON products_images (image_id)');
    }
}
