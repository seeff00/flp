<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231207132844 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE product_category CHANGE description description VARCHAR(1000) NOT NULL');
        $this->addSql('ALTER TABLE product_request CHANGE executed_at executed_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', CHANGE comment comment VARCHAR(500) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE product_category CHANGE description description VARCHAR(1000) DEFAULT NULL');
        $this->addSql('ALTER TABLE product_request CHANGE executed_at executed_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', CHANGE comment comment VARCHAR(500) DEFAULT NULL');
    }
}
