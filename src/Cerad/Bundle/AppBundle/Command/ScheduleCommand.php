<?php

namespace Cerad\Bundle\AppBundle\Command;

use Zayso\ArbiterBundle\Schedule\LoadLesSchedule;
use Zayso\ArbiterBundle\Schedule\SaveArbiterSchedule;
use Zayso\ArbiterBundle\Schedule\SaveRefereeSchedule;

use Zayso\ArbiterBundle\Schedule\LoadArbiterSchedule;
use Zayso\ArbiterBundle\Schedule\CompareSchedules;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
//  Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
//  Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

class ScheduleCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('app:schedule:import')
            ->setDescription('App Schedule')
        ;
    }
    protected function getService($id)     { return $this->getContainer()->get($id); }
    protected function getParameter($name) { return $this->getContainer()->getParameter($name); }
    
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $file = 'Schedule20130508.xls';
        $datax = $this->getParameter('datax');
        
        $params = array
        (
            'truncate' => true,
            'output'    => 'Post', // Scan, Excel
            'sport'     => 'Soccer',
            'season'    => 'SP2013',
            'domain'    => 'AYSOA5B',
            'domainSub' => 'Games',
            
            'defaultGameStatus' => 'Normal',
            'inputFileName'     => $datax . $file,
            'worksheetName'     => 'Schedule',
        );
        $import = $this->getService('cerad_tourn.schedule.import');
        
        $results = $import->importFile($params);

      //$this->testLoadLesSchedule();
      //$this->testLoadArbiterSchedule();
    }
    protected function testLoadLesSchedule()
    {
        $loader = $this->getService('cerad_arbiter.schedule.tourn.les.load');
        
        $datax = $this->getParameter('datax');
        
        $items = $loader->load($datax . '/classic/ScheduleLes20130415.csv');
        
        echo sprintf("Games: %d\n",count($items));
        
        $saver = $this->getService('cerad_arbiter.schedule.tourn.arbiter.save');
        
        $saver->save($datax . '/classic/ScheduleArbiter20130415.csv',$items);
    }
    protected function testLoadArbiterSchedule()
    {
        $loader = $this->getService('cerad_arbiter.schedule.tourn.arbiter.load');
        
        $datax = $this->getParameter('datax');
        
        $items = $loader->load($datax . '/classic/Schedule20130418.xls');
        
        echo sprintf("Games: %d\n",count($items));
        
        $saver = $this->getService('cerad_arbiter.schedule.tourn.referee.save');
        
        $saver->save($datax . '/classic/ScheduleReferee20130418.csv',$items);
    }
    /* ===========================================================================
     * Old stuff
     */
    
    protected function test6()
    {
      //$importArbiter = new ImportArbiterSchedule();
      //$arbiterGames = $importArbiter->import('../datax/ClassicSchedule20120420.csv');
        
      //echo 'Arbiter Game Count: ' . count($arbiterGames) . "\n";
       
        $lesLoad = new LoadLesSchedule();
        $lesGames  = $lesLoad->load('../datax/KicksLes20121014.csv');
        
        echo 'Les     Game Count: ' . count($lesGames) . "\n";
        
        $lesSave = new SaveArbiterSchedule();
        $lesSave->save('../datax/KicksArbiter20121014.csv',$lesGames);
        
        return;
        
        $compare = new CompareSchedules();
        $compare->compare($arbiterGames,$lesGames);
    }
    protected function testPositions()
    {
        $arbiterLoad = new LoadArbiterSchedule();
        $arbiterGames = $arbiterLoad->load('../datax/KicksArbiter20121021.csv');
        
        echo 'Arbiter Game Count: ' . count($arbiterGames) . "\n";
     
        $arbSave = new SaveRefereeSchedule();
        $arbSave->save('../datax/KicksReferees20121021.csv',$arbiterGames);
        
        return;
    }
    protected function testCompare()
    {
        $arbiterLoad = new LoadArbiterSchedule();
        $arbiterGames = $arbiterLoad->load('../datax/KicksArbiter20121021.csv');
        
        echo 'Arbiter Game Count: ' . count($arbiterGames) . "\n";
       
        $lesLoad = new LoadLesSchedule();
        $lesGames  = $lesLoad->load('../datax/KicksLes20121017.csv');
        
        echo 'Les     Game Count: ' . count($lesGames) . "\n";
        
        $compare = new CompareSchedules();
        $compare->compare($arbiterGames,$lesGames);
    }
     protected function testLoadArbiter()
    {
        $arbiterLoad = $this->getContainer()->get('zayso_arbiter.schedule.load');
        $arbiterGames = $arbiterLoad->load('../datax/KicksArbiterSchedule20121024.xls');
        
        echo 'Arbiter Game Count: ' . count($arbiterGames) . "\n";
        
        $gameNums = array_keys($arbiterGames);
        
        $game = $arbiterGames[$gameNums[4]];
        echo sprintf("Game %s %s %s %s\n",$game->getGameNum(),$game->getSite(),$game->getHomeTeam(),$game->getCR());
        
        return;
        
        $arbiterGames = $arbiterLoad->load('../datax/KicksArbiter20121021.csv');
        
        echo 'Arbiter Game Count: ' . count($arbiterGames) . "\n";
        
    }
}
?>
