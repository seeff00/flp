<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231119051947 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE image DROP FOREIGN KEY FK_C53D045F8632E6C3');
        $this->addSql('DROP INDEX IDX_C53D045F8632E6C3 ON image');
        $this->addSql('ALTER TABLE image DROP products_images_id');
        $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD8632E6C3');
        $this->addSql('DROP INDEX IDX_D34A04AD8632E6C3 ON product');
        $this->addSql('ALTER TABLE product DROP products_images_id');
        $this->addSql('ALTER TABLE products_images ADD product_id INT DEFAULT NULL, ADD image_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE products_images ADD CONSTRAINT FK_662C35404584665A FOREIGN KEY (product_id) REFERENCES product (id)');
        $this->addSql('ALTER TABLE products_images ADD CONSTRAINT FK_662C35403DA5256D FOREIGN KEY (image_id) REFERENCES image (id)');
        $this->addSql('CREATE INDEX IDX_662C35404584665A ON products_images (product_id)');
        $this->addSql('CREATE INDEX IDX_662C35403DA5256D ON products_images (image_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE image ADD products_images_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE image ADD CONSTRAINT FK_C53D045F8632E6C3 FOREIGN KEY (products_images_id) REFERENCES products_images (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_C53D045F8632E6C3 ON image (products_images_id)');
        $this->addSql('ALTER TABLE products_images DROP FOREIGN KEY FK_662C35404584665A');
        $this->addSql('ALTER TABLE products_images DROP FOREIGN KEY FK_662C35403DA5256D');
        $this->addSql('DROP INDEX IDX_662C35404584665A ON products_images');
        $this->addSql('DROP INDEX IDX_662C35403DA5256D ON products_images');
        $this->addSql('ALTER TABLE products_images DROP product_id, DROP image_id');
        $this->addSql('ALTER TABLE product ADD products_images_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD8632E6C3 FOREIGN KEY (products_images_id) REFERENCES products_images (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_D34A04AD8632E6C3 ON product (products_images_id)');
    }
}
